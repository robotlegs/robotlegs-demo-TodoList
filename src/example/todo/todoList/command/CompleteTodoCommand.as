package example.todo.todoList.command
{
	import robotlegs.bender.bundles.mvcs.Command;
	
	import example.todo.core.domain.Todo;
	import example.todo.core.domain.api.ITodoCollection;

	public class CompleteTodoCommand extends Command
	{
		[Inject]
		public var todoToComplete: Todo;
		
		[Inject]
		public var todoCollection: ITodoCollection;
		
		override public function execute():void
		{
			todoCollection.remove(todoToComplete);
		}
	}
}