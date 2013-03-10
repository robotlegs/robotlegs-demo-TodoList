package todo.example.core.domain
{
	import mx.utils.UIDUtil;
	
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.notNullValue;
	import org.hamcrest.text.emptyString;

	public class TodoTests
	{
		/**
		 * By default the Todo should have an id generated
		 * that represents a uid.
		 */
		[Test]
		public function default_IdIsGuid(): void
		{
			assertThat(new Todo().id.length, equalTo(UIDUtil.createUID().length));
		}
	}
}