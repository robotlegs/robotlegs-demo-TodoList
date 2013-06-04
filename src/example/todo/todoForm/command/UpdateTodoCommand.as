package example.todo.todoForm.command
{
	import robotlegs.bender.bundles.mvcs.Command;
	
	import example.todo.core.domain.api.ITodoCollection;
	
	public class UpdateTodoCommand extends Command
	{
		[Inject]
		public var taskDescription: String;
		
		[Inject]
		public var todoCollection: ITodoCollection;
		
		override public function execute():void
		{
			todoCollection.activeTodo.task = taskDescription;
			todoCollection.activeTodo = null;
		}
	}
}