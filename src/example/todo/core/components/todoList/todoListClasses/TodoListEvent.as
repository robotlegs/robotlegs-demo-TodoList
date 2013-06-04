package example.todo.core.components.todoList.todoListClasses
{
	import flash.events.Event;
	
	import example.todo.core.domain.Todo;
	
	public class TodoListEvent extends Event
	{
		public static const COMPLETE: String = "completeTodo";
		public static const MODIFY: String = "modifyTodo";
		
		private var _todo: Todo;
		
		public function get todo(): Todo
		{
			return _todo;
		}
		
		public function TodoListEvent(type:String, todo: Todo)
		{
			super(type, true, true);
			
			_todo = todo;
		}
		
		override public function clone():Event
		{
			return new TodoListEvent(type, _todo);
		}
	}
}