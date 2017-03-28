class TodoList < ActiveRecord::Migration #Should be called add todolist to users probably 
  def change
  	 add_reference :todo_lists, :user, index:true, foreign_key: true
  	 #Add foreign key to todo_lists to point to user.  Adding User_id to todolists table
  end
end
