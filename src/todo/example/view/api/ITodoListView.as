package todo.example.view.api
{
	import mx.collections.ArrayCollection;
	
	import org.osflash.signals.ISignal;

	public interface ITodoListView extends IView
	{
		function get createNewSignal(): ISignal;
		
		function setTasks(todos: ArrayCollection): void;
	}
}