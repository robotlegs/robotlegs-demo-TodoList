package todo.example.core.domain.api
{
	import mx.collections.ArrayCollection;
	
	import org.osflash.signals.ISignal;
	
	import todo.example.core.domain.Todo;

	public interface ITodoCollection
	{
		function get changedSignal(): ISignal;
		
		function get activeTodo(): Todo;
		function set activeTodo(value: Todo): void;
		
		function add(todo: Todo): void;
		function all(): ArrayCollection;
		function remove(todo: Todo): void;
	}
}