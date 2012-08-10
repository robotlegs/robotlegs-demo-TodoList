package todo.example.mediator
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	import todo.example.ui.api.IPopup;
	import todo.example.view.TodoFormView;
	import todo.example.view.api.ITodoListView;

	public class TodoListViewMediator extends Mediator
	{
		[Inject]
		public var popup: IPopup;
		
		[Inject]
		public var view: ITodoListView;
		
		override public function destroy():void
		{
			super.destroy();
			
			view.dispose();
			
			view = null;
			popup = null;
		}
		
		override public function initialize():void
		{
			view.createNewSignal.add(displayTodoFormView);
		}
		
		/**
		 * Displays the TodoFormView to the user.
		 */
		private function displayTodoFormView(): void
		{
			var todoFormView: TodoFormView = new TodoFormView();
			popup.add(todoFormView);
		}
	}
}