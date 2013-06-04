package example.todo.todoForm.signal
{
	import org.osflash.signals.Signal;

	public class UpdateTodoSignal extends Signal
	{
		public function UpdateTodoSignal()
		{
			super(String);
		}
	}
}