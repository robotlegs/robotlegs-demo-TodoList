package example.todo.todoList.mediator
{
	import flashx.textLayout.tlf_internal;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	import example.todo.core.domain.Todo;
	import example.todo.core.domain.TodoCollection;
	import example.todo.core.domain.api.ITodoCollection;
	import example.todo.todoList.signal.CompleteTodoSignal;
	import example.todo.todoList.view.api.ITodoListView;
	import example.todo.core.ui.api.IPopup;
	import example.todo.core.util.VectorUtil;
	import example.todo.todoForm.view.TodoFormView;

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
			view.modifySignal.add(modifyTodo);
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
		 * Sets the Todo as the active todo item, so the application
		 * knows which Todo item to modify. The TodoForm is shown
		 * to the user to allow them to modify a todo.
		 */
		private function modifyTodo(todo: Todo): void
		{
			todoCollection.activeTodo = todo;
			displayTodoFormView();
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