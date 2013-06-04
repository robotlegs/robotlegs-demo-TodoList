package example.todo.core.util
{
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.hasItems;

	public class VectorUtilTests
	{
		/**
		 * The toArrayCollection method should convert the Vector argument to an
		 * array collection.
		 */
		[Test]
		public function toArrayCollection_ReturnsArrayCollectonContainingItemsFromVector(): void
		{
			var exampleVector: Vector.<String> = new Vector.<String>();
			exampleVector.push("Example");
			exampleVector.push("Strings");
			
			assertThat(VectorUtil.toArrayCollection(exampleVector), hasItems("Example", "Strings"));
			
		}
	}
}