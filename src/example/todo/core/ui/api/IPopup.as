package example.todo.core.ui.api
{
	import flash.display.DisplayObject;
	
	import example.todo.core.view.IView;

	public interface IPopup
	{
		function add(view: IView): void;
		function remove(view: IView): void;
	}
}