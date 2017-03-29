class TodoItemsController < ApplicationController
  before_action :set_todo_list, :set_todo_item, only: [:show, :edit, :update, :destroy]

  # GET todo_lists/todo_items

 
  # GET /todo_lists/:todo_list_id/todo_items/1
  def show
  end

  # GET /todo_items/new
  # GET /todo_lists/:todo_list_id/todo_items/new
  def new
    #@todo_item = ToDoItem.new(todo_list_id, :todo_list_id)
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_item = @todo_list.todo_items.new 
    #Should be no completed box.  Somehow this calls the form? So it's new >>form>>if form is submitted>>create is called with the params from the form 
  end

  # GET /todo_lists/:todo_list_id/todo_items/1/edit
  def edit
  end


  # POST /todo_lists/:todo_list_id/todo_items
  def create
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_item = @todo_list.todo_items.new(todo_item_params) 
   

    respond_to do |format|
      if @todo_item.save
        format.html { redirect_to todo_list_url(@todo_list), notice: 'Todo item was successfully created.' }
        format.json { render :show, status: :created, location: @todo_item }
      else
        format.html { render :new }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

 
  # PATCH/PUT /todo_lists/:todo_list_id/todo_items/1
  def update
    respond_to do |format|
      if @todo_item.update(todo_item_params)
        #format.html { redirect_to todo_list_todo_item_url, notice: 'Todo item was successfully updated.' } #Why don't I have to send in the ids here?
        format.html { redirect_to todo_list_url(@todo_list), notice: 'Todo item was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo_item }
      else
        format.html { render :edit }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

 
  # DELETE /todo_lists/:todo_list_id/todo_items/1
  def destroy
    @todo_item.destroy
    respond_to do |format|
      format.html { redirect_to todo_list_url(@todo_list), notice: 'Todo item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_item
      @todo_item = @todo_list.todo_items.find(params[:id])
    end

    def set_todo_list
      @todo_list = TodoList.find(params[:todo_list_id])
      #@todo_list = TodoList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_item_params
      params.require(:todo_item).permit(:title, :due_date, :description, :completed)
    end
end
