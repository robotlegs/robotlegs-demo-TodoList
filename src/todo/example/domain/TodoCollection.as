package todo.example.domain
{
	import flash.geom.Vector3D;
	
	import mx.collections.ArrayCollection;
	
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	
	import todo.example.domain.api.ITodoCollection;
	import todo.example.util.VectorUtil;

	public class TodoCollection implements ITodoCollection
	{
		private var _source: Vector.<Todo>;
		
		private var _changedSignal: Signal = new Signal();
		
		/**
		 * Dispatched when the collection is
		 * changed.
		 */
		public function get changedSignal(): ISignal
		{
			return _changedSignal;
		}
		
		private var _activeTodo: Todo;
		
		/**
		 * Todo that is currently in focus, most likely
		 * being modified by the user.
		 */
		public function get activeTodo(): Todo
		{
			return _activeTodo;
		}
		
		public function set activeTodo(value: Todo): void
		{
			_activeTodo = value;
		}
		
		/**
		 * Returns the number of todos in the
		 * collection.
		 */
		public function get length(): Number
		{
			return _source.length;
		}
		
		/**
		 * Source of the collection that holds all the
		 * Todos.
		 */
		public function get source(): Vector.<Todo>
		{
			return _source;
		}
		
		public function TodoCollection()
		{
			_source = new Vector.<Todo>();	
		}
		
		/**
		 * Adds a new Todo item to the collection.
		 */
		public function add(todo: Todo): void
		{
			_source.push(todo);
			changed();
		}
		
		/**
		 * Returns all the todo items in an ArrayCollection.
		 */
		public function all(): ArrayCollection
		{
			return VectorUtil.toArrayCollection(_source);
		}
		
		/**
		 * Dispatches the changedSignal to notify
		 * listeners that the collection has changed.
		 */
		private function changed(): void	
		{
			_changedSignal.dispatch();
		}
		
		/**
		 * Removes the Todo value passed in the arguments
		 * from the collection.
		 */
		public function remove(todo: Todo): void
		{
			_source.splice(_source.indexOf(todo), 1);
			changed();
		}
	}
}