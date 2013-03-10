package todo.example.todoList.signal
{
	import org.osflash.signals.Signal;
	
	import todo.example.core.domain.Todo;
	
	public class CompleteTodoSignal extends Signal
	{
		public function CompleteTodoSignal()
		{
			super(Todo);
		}
	}
}