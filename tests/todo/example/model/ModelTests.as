package todo.example.model
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.notNullValue;
	
	import todo.example.model.api.IModel;

	public class ModelTests
	{
		/**
		 * Tests that the Model implements IModel.
		 */
		[Test]
		public function implements_expectedInterface(): void
		{
			assertThat(new Model() as IModel, notNullValue());
		}
		
		/**
		 * By default the model should have a TodosCollection.
		 */
		[Test]
		public function default_todosCollectionIsNotNull(): void
		{
			assertThat(new Model().todos, notNullValue());
		}
	}
}