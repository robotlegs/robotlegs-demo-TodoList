package todo.example.components.todoList
{
	import spark.components.List;

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
			labelField = "task";
			setStyle("borderVisible", false);			
		}
	}
}