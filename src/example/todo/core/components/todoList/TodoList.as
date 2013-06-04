package example.todo.core.components.todoList
{
	import mx.core.ClassFactory;
	
	import spark.components.List;
	
	import example.todo.core.components.todoList.todoListClasses.TodoListItemRenderer;

	[Event(name="completeTodo", type="example.todo.core.components.todoList.todoListClasses.TodoListEvent")]
	[Event(name="modifyTodo", type="example.todo.core.components.todoList.todoListClasses.TodoListEvent")]
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