package example.todo.todoList.view
{
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	
	import example.todo.core.components.todoList.todoListClasses.TodoListEvent;
	import example.todo.core.domain.Todo;
	import example.todo.todoList.view.api.ITodoListView;
	import example.todo.todoList.view.ui.TodoListViewBase;
	
	public class TodoListView extends TodoListViewBase implements ITodoListView
	{
		private var _completeSignal: ISignal;
		
		/**
		 * Dispatched when the user wishes to mark a form
		 * as completed.
		 */
		public function get completeSignal(): ISignal
		{
			return _completeSignal;
		}
		
		private var _createNewSignal: ISignal;
		
		/**
		 * Dispatched when the user wishes to create a new
		 * todo. This should dispatch when the user clicks
		 * the create new button.
		 */
		public function get createNewSignal(): ISignal
		{
			return _createNewSignal;
		}
		
		private var _modifySignal: ISignal;
		
		/**
		 * Dispatched when the user wishes to modify
		 * a todo item.
		 */
		public function get modifySignal(): ISignal
		{
			return _modifySignal;
		}
		
		public function TodoListView()
		{
			_createNewSignal = new Signal();
			_completeSignal = new Signal(Todo);
			_modifySignal = new Signal(Todo);
		}
		
		override protected function childrenCreated():void
		{
			super.childrenCreated();
			
			addListeners();
		}
		
		/**
		 * Adds event listeners to the UI for the
		 * view.
		 */
		private function addListeners(): void
		{
			createNewButton.addEventListener(MouseEvent.CLICK, createNew);
			todoList.addEventListener(TodoListEvent.COMPLETE, completeTodo);
			todoList.addEventListener(TodoListEvent.MODIFY, modifyTodo);
		}
		
		/**
		 * Dispatches the completeSignal that notifies the
		 * application the user wishes to a todo to be marked
		 * as completed.
		 */
		private function completeTodo(e: TodoListEvent): void
		{
			_completeSignal.dispatch(e.todo);
		}
		
		/**
		 * Dispatches the createNewSignal that notifies the
		 * application the user wishes to create a new task.
		 */
		private function createNew(e: MouseEvent): void
		{
			_createNewSignal.dispatch();
		}
		
		/**
		 * Disposes of the view.
		 */
		public function dispose(): void
		{
			createNewButton.removeEventListener(MouseEvent.CLICK, createNew);
			todoList.removeEventListener(TodoListEvent.COMPLETE, completeTodo);
			todoList.removeEventListener(TodoListEvent.MODIFY, modifyTodo);
			
			_createNewSignal.removeAll();
			_completeSignal.removeAll();
			_modifySignal.removeAll();
		}
		
		/**
		 * Dispatches the modifySignal to that notifies the application
		 * that the user wishes to modify the todo item that is contained
		 * within the event parameter.
		 */
		private function modifyTodo(e: TodoListEvent): void
		{
			_modifySignal.dispatch(e.todo);
		}
		
		/**
		 * Sets the todos that are to be displayed on the todo
		 * list.
		 */
		public function setTodos(todos: ArrayCollection): void
		{
			todoList.dataProvider = todos;
			
			todoList.includeInLayout = todoList.visible = todos.length > 0;
			nothingTodoLabel.includeInLayout = nothingTodoLabel.visible = !todoList.visible;
		}
	}
}