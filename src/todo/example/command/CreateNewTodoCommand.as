package todo.example.command
{
	import robotlegs.bender.bundles.mvcs.Command;
	
	import todo.example.domain.Todo;
	import todo.example.model.api.IModel;
	
	public class CreateNewTodoCommand extends Command
	{
		[Inject]
		public var model: IModel;
		
		[Inject]
		public var taskDescription: String;
		
		override public function execute():void
		{
			var newTodo: Todo = new Todo();
			newTodo.task = taskDescription;
			
			model.todos.add(newTodo);
		}
	}
}