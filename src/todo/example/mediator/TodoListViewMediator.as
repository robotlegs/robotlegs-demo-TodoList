package todo.example.mediator
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	import todo.example.domain.TodoCollection;
	import todo.example.domain.api.ITodoCollection;
	import todo.example.ui.api.IPopup;
	import todo.example.util.VectorUtil;
	import todo.example.view.TodoFormView;
	import todo.example.view.api.ITodoListView;

	public class TodoListViewMediator extends Mediator
	{
		[Inject]
		public var todoCollection: ITodoCollection;
		
		[Inject]
		public var popup: IPopup;
		
		[Inject]
		public var view: ITodoListView;
		
		override public function destroy():void
		{
			super.destroy();
			
			view.dispose();
			
			todoCollection.changedSignal.remove(setTodosOnView);
			
			todoCollection = null;
			view = null;
			popup = null;
		}
		
		override public function initialize():void
		{
			view.createNewSignal.add(displayTodoFormView);
			todoCollection.changedSignal.add(setTodosOnView);
		}
		
		/**
		 * Displays the TodoFormView to the user.
		 */
		private function displayTodoFormView(): void
		{
			var todoFormView: TodoFormView = new TodoFormView();
			popup.add(todoFormView);
		}
		
		/**
		 * Sets the collection of todos onto the
		 * view.
		 */
		private function setTodosOnView(): void
		{
			view.setTasks(VectorUtil.toArrayCollection(todoCollection.all()));
		}
	}
}