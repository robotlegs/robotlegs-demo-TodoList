package todo.example.todoList.view
{
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	
	import org.fluint.uiImpersonation.UIImpersonator;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.isFalse;
	import org.hamcrest.object.isTrue;
	import org.hamcrest.object.notNullValue;
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	import org.osflash.signals.utils.SignalAsyncEvent;
	import org.osflash.signals.utils.handleSignal;
	import org.osflash.signals.utils.proceedOnSignal;
	
	import todo.example.core.components.todoList.todoListClasses.TodoListEvent;
	import todo.example.core.domain.Todo;
	import todo.example.todoList.view.api.ITodoListView;
	import todo.example.testing.ViewTests;

	public class TodoListViewTests extends ViewTests
	{
		[After]
		override public function after(): void
		{
			super.after();
		}
		
		/**
		 * Tests that the TodoListView implements ITodoListView.
		 */
		[Test]
		public function implements_expectedInterface(): void
		{
			assertThat(createView() as ITodoListView, notNullValue());
		}
		
		/**
		 * By default the createNewSignal shouldn't be null.
		 */
		[Test]
		public function default_createNewSignalIsNotNull(): void	
		{
			assertThat(createView().createNewSignal, notNullValue());
		}
		
		/**
		 * By default the todoList should be hidden because it
		 * won't contain any items.
		 */
		[Test]
		public function default_todoListShouldBeHidden(): void
		{
			assertThat(createView().todoList.visible, isFalse());
		}
		
		/**
		 * By default the completeSignal shouldn't be null.
		 */
		[Test]
		public function default_completeSignalIsNotNull(): void
		{
			assertThat(createView().completeSignal, notNullValue());
		}

		/**
		 * By default the modifySignal shouldn't be null.
		 */
		[Test]
		public function default_modifySignalIsNotNull(): void
		{
			assertThat(createView().modifySignal, notNullValue());
		}
		
		/**
		 * Tests that when the createNewButton is clicked then the createNewSignal
		 * should be dispatched.
		 */
		[Test(async)]
		public function clickCreateNewButton_DispatchesCreateNewSignal(): void
		{
			var todoListView: TodoListView = createView();
			proceedOnSignal(this, todoListView.createNewSignal);
			click(todoListView.createNewButton);
		}
		
		/**
		 * Disposing of the view should remove all the listeners on the 
		 * createNewSignal.
		 */
		[Test]
		public function dispose_RemovesListenersToCreateNewSignal(): void
		{
			var todoListView: TodoListView = createView();
			todoListView.createNewSignal.add(dummyMethod);
			todoListView.dispose();
			
			assertThat(todoListView.createNewSignal.numListeners, equalTo(0));
		}
		
		/**
		 * Disposing of the view should remove all the listeners on the 
		 * completeSignal.
		 */
		[Test]
		public function dispose_RemovesListenersToCompleteSignal(): void
		{
			var todoListView: TodoListView = createView();
			todoListView.completeSignal.add(dummyMethod);
			todoListView.dispose();
			
			assertThat(todoListView.completeSignal.numListeners, equalTo(0));
		}	
		
		/**
		 * Disposing of the view should remove all the listeners on the 
		 * modifySignal.
		 */
		[Test]
		public function dispose_RemovesListenersToModifySignal(): void
		{
			var todoListView: TodoListView = createView();
			todoListView.modifySignal.add(dummyMethod);
			todoListView.dispose();
			
			assertThat(todoListView.modifySignal.numListeners, equalTo(0));
		}	
		
		/**
		 * setTodos should set the argument received onto the todoList.
		 */
		[Test]
		public function setTodos_ShouldSetDataProviderOnTodoList(): void
		{
			var expectedTodos: ArrayCollection = new ArrayCollection();
			
			var todoListView: TodoListView = createView();
			todoListView.setTodos(expectedTodos);
			assertThat(todoListView.todoList.dataProvider, equalTo(expectedTodos));
		}
		
		/**
		 * When an empty collection of todos is set on the view, the todoList
		 * UI component should be hidden.
		 */
		[Test]
		public function setTodos_NoTasks_todoListShouldBeHidden(): void
		{
			var todoListView: TodoListView = createView();
			todoListView.setTodos(new ArrayCollection());
			assertThat(todoListView.todoList.visible, isFalse());
		}
		
		/**
		 * When an empty collection of todos is set on the view, the message
		 * stating that there is nothing to do should be visible.
		 */
		[Test]
		public function setTodos_NoTasks_nothingTodoLabelShouldBeVisible(): void
		{
			var todoListView: TodoListView = createView();
			todoListView.setTodos(new ArrayCollection());
			assertThat(todoListView.nothingTodoLabel.visible, isTrue());
		}
		
		/**
		 * When a collection of todos is set on the view, the todoList
		 * UI component should be visible.
		 */
		[Test]
		public function setTodos_WithTasks_todoListShouldBeVisible(): void
		{
			var todoListView: TodoListView = createView();
			todoListView.setTodos(new ArrayCollection([new Todo(), new Todo(), new Todo()]));
			assertThat(todoListView.todoList.visible, isTrue());
		}
		
		/**
		 * When a collection of todos is set on the view, the message stating
		 * that there are no todos should be hidden.
		 */
		[Test]
		public function setTodos_WithTasks_nothingTodoLabelShouldBeHidden(): void
		{
			var todoListView: TodoListView = createView();
			todoListView.setTodos(new ArrayCollection([new Todo(), new Todo(), new Todo()]));
			assertThat(todoListView.nothingTodoLabel.visible, isFalse());
		}
		
		/**
		 * When the user wishes a todo to be completed, the completeSignal should
		 * dispatch containing the todo in question.
		 */
		[Test(async)]
		public function completeTodo_DispatchesCompleteSignalWithTodo(): void
		{
			var expectedTodo: Todo = new Todo();
			var todoListView: TodoListView = createView();
			handleSignal(this, todoListView.completeSignal, verifyTodo, 500, expectedTodo);
			simulateComplete(todoListView, expectedTodo);
		}
		
		/**
		 * When the user wants to modify a todo, the modifySignal should
		 * dispatch containing the todo in question.
		 */
		[Test(async)]
		public function modifyTodo_DispatchesModifySignalWithTodo(): void
		{
			var expectedTodo: Todo = new Todo();
			var todoListView: TodoListView = createView();
			handleSignal(this, todoListView.modifySignal, verifyTodo, 500, expectedTodo);
			simulateModify(todoListView, expectedTodo);
		}

		/**
		 * Creates the test subject.
		 */
		private function createView(): TodoListView
		{
			var todoListView: TodoListView = new TodoListView();
			addToUI(todoListView);
			return todoListView;
		}

		/**
		 * Simulates the user trigger the completion of a todo.
		 */
		private function simulateComplete(todoListView: TodoListView, todo: Todo): void
		{
			todoListView.todoList.dispatchEvent(new TodoListEvent(TodoListEvent.COMPLETE, todo));
		}
		
		/**
		 * Simulates the user trigger the modifiction of a todo.
		 */
		private function simulateModify(todoListView: TodoListView, todo: Todo): void
		{
			todoListView.todoList.dispatchEvent(new TodoListEvent(TodoListEvent.MODIFY, todo));
		}
		
		/**
		 * Verifies that the expected todo has been included as an argument
		 * in a signal dispatch.
		 */
		private function verifyTodo(e: SignalAsyncEvent, todo: Todo): void
		{
			assertThat(e.args[0], equalTo(todo));
		}
	}
}