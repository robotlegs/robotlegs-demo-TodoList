package todo.example.model
{
	import todo.example.domain.Todo;
	import todo.example.domain.TodoCollection;
	import todo.example.model.api.IModel;

	public class Model implements IModel
	{
		private var _todos: TodoCollection = new TodoCollection();
		
		/**
		 * Holds the users todos.
		 */
		public function get todos(): TodoCollection
		{
			return _todos;
		}
	}
}