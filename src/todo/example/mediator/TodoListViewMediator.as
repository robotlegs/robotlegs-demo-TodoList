package todo.example.mediator
{
	import flashx.textLayout.tlf_internal;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	import todo.example.domain.Todo;
	import todo.example.domain.TodoCollection;
	import todo.example.domain.api.ITodoCollection;
	import todo.example.signal.CompleteTodoSignal;
	import todo.example.ui.api.IPopup;
	import todo.example.util.VectorUtil;
	import todo.example.view.TodoFormView;
	import todo.example.view.api.ITodoListView;

	public class TodoListViewMediator extends Mediator
	{
		[Inject]
		public var completeTodoSignal: CompleteTodoSignal;
		
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
			view.completeSignal.add(completeTodo);
			todoCollection.changedSignal.add(setTodosOnView);
		}
		
		/**
		 * Dispatches the completeTodoSignal to trigger the
		 * completion of a todo.
		 */
		private function completeTodo(todo: Todo): void
		{
			completeTodoSignal.dispatch(todo);
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
			view.setTodos(todoCollection.all());
		}
	}
}