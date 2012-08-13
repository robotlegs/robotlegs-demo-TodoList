package todo.example.domain
{
	import flash.geom.Vector3D;
	
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;

	public class TodoCollection
	{
		private var _source: Vector.<Todo>;
		
		/**
		 * Returns the number of todos in the
		 * collection.
		 */
		public function get length(): Number
		{
			return _source.length;
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
		}
		
		/**
		 * Returns all the todo items so that we
		 * can loop over the items.
		 */
		public function all(): Vector.<Todo>
		{
			return _source;
		}
	}
}