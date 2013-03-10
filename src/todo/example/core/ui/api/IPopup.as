package todo.example.core.ui.api
{
	import flash.display.DisplayObject;
	
	import todo.example.core.view.IView;

	public interface IPopup
	{
		function add(view: IView): void;
		function remove(view: IView): void;
	}
}