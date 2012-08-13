package todo.example.domain
{
	import org.hamcrest.assertThat;
	import org.hamcrest.number.greaterThan;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.notNullValue;

	public class TodoCollectionTests
	{
		/**
		 * Length of the collection should default to 0.
		 */
		[Test]
		public function default_lengthEqualToZero(): void
		{
			assertThat(new TodoCollection().length, equalTo(0));
		}
		
		/**
		 * Tests that all returns an empty collection.
		 */
		[Test]
		public function default_allReturnsEmptyCollection(): void
		{
			assertThat(new TodoCollection().all().length, equalTo(0));
		}
		
		/**
		 * Tests that adding a new collection should increase the
		 * length property by one.
		 */
		[Test]
		public function add_ShouldIncreaseLengthByOne(): void
		{
			var newTodo: Todo = new Todo();
			var todoCollection: TodoCollection = new TodoCollection();
			
			todoCollection.add(newTodo);
			
			assertThat(todoCollection.length, equalTo(1));
		}
		
		/**
		 * Tests that the todo item that is added to the collection exists
		 * in the collection returned by the all method.
		 */
		[Test]
		public function add_ItemShouldBeInCollectionReturnedByAll(): void
		{
			var newTodo: Todo = new Todo();
			var todoCollection: TodoCollection = new TodoCollection();
			
			todoCollection.add(newTodo);
			
			assertThat(todoCollection.all().indexOf(newTodo), greaterThan(-1));
		}
	}
}