package example.todo.todoList.signal
{
	import org.osflash.signals.Signal;
	
	import example.todo.core.domain.Todo;
	
	public class CompleteTodoSignal extends Signal
	{
		public function CompleteTodoSignal()
		{
			super(Todo);
		}
	}
}