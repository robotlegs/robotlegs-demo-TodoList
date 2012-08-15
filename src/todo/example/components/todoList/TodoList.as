package todo.example.components.todoList
{
	import mx.core.ClassFactory;
	
	import spark.components.List;
	
	import todo.example.components.todoList.todoListClasses.TodoListItemRenderer;

	[Event(name="completeTodo", type="todo.example.components.todoList.todoListClasses.TodoListEvent")]
	public class TodoList extends List
	{
		public function TodoList()
		{
			super();
			
			setDefaults();
		}
		
		/**
		 * Sets the default properties & styles
		 * for the component.
		 */
		private function setDefaults(): void
		{
			setStyle("borderVisible", false);		
			itemRenderer = new ClassFactory(TodoListItemRenderer);
		}
	}
}