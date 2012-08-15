package todo.example.domain.api
{
	import mx.collections.ArrayCollection;
	
	import org.osflash.signals.ISignal;
	
	import todo.example.domain.Todo;

	public interface ITodoCollection
	{
		function get changedSignal(): ISignal;
		
		function add(todo: Todo): void;
		function all(): ArrayCollection;
		function remove(todo: Todo): void;
	}
}