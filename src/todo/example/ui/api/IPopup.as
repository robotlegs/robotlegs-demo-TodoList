package todo.example.ui.api
{
	import todo.example.view.api.IView;

	public interface IPopup
	{
		function add(view: IView): void;
		function remove(view: IView): void;
	}
}