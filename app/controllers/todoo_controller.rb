class TodooController < ApplicationController
  
  def index
      @todos = Todoo.where(done: false)
      @todone = Todoo.where(done: true)
      end

#Start of code that handles the creation of new todo items
  def new
    @todo = Todoo.new
  end
  
  def todo_params
    params.require(:todoo).permit(:name, :done)
  end

  def create
    @todo = Todoo.new(todo_params)
    if @todo.save
      redirect_to todoo_index_path, :notice => "Your todo item was created!"
  else
    render "New"  
  end 
 end

#Start of code that handles the updating of todo items
  def update
    @todo = Todoo.find(params[:id])
    if @todo.update_attribute(:done, true)
      redirect_to todoo_index_path, :notice => "Your todo item was marked as done!"
  else
    redirect_to todoo_index_path, :notice => "We are unable to mark the todo item as done!"   
  end
end  
 
#Start of code that handles the deletion of  todo items
    def destroy
       @todo = Todoo.find(params[:id])
       @todo.destroy
       
       redirect_to todoo_index_path, :notice => "Your todo item has been deleted!"   
      end
end