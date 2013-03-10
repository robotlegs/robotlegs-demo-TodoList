package todo.example.core.domain
{
	import mx.utils.UIDUtil;

	[Bindable]
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