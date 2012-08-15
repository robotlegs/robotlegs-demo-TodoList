package todo.example.view
{
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	
	import todo.example.domain.Todo;
	import todo.example.view.api.ITodoListView;
	import todo.example.view.ui.TodoListViewBase;
	
	public class TodoListView extends TodoListViewBase implements ITodoListView
	{
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
		
		public function TodoListView()
		{
			_createNewSignal = new Signal();
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
			_createNewSignal.removeAll();
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