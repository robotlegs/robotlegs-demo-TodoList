package todo.example.model.api
{
	import todo.example.domain.Todo;
	import todo.example.domain.TodoCollection;

	public interface IModel
	{
		function get todos(): TodoCollection;	
	}
}