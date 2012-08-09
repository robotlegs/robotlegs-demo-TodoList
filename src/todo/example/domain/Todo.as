package todo.example.domain
{
	import mx.utils.UIDUtil;

	public class Todo
	{
		public var id: String;
		public var task: String;
		
		public function Todo()
		{
			id = UIDUtil.createUID();
		}
	}
}