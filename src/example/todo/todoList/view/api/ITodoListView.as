package example.todo.todoList.view.api
{
	import mx.collections.ArrayCollection;
	
	import org.osflash.signals.ISignal;
	import example.todo.core.view.IView;

	public interface ITodoListView extends IView
	{
		function get createNewSignal(): ISignal;
		function get completeSignal(): ISignal;
		function get modifySignal(): ISignal;
		
		function setTodos(todos: ArrayCollection): void;
	}
}