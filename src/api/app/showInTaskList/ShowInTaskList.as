package api.app.showInTaskList
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showInTaskList.html Northcode Help Documentation
	 */
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showInTaskList.html Northcode Help Documentation
	 */
	public class ShowInTaskList extends App
	{
		/**
		 * 
		 *
		 * @defaultValue <code>true</code>
		 */
		/**
		 * 
		 *
		 * @defaultValue <code>true</code>
		 */
		public var flag:Boolean = true;
		
		/**
		 * Constructor for App.ShowInTaskList()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showInTaskList.html Northcode Help Documentation
		 */
		/**
		 * Constructor for App.ShowInTaskList()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showInTaskList.html Northcode Help Documentation
		 */
		public function ShowInTaskList(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function show():void
		{
			flag = true;
			showInTaskList();
		}
		public function hide():void
		{
			flag = false;
			showInTaskList();
		}
		private function showInTaskList():void
		{
			ssCore.App.showInTaskList( {flag:flag} , {callback:actionComplete, errorSTR:"showInTaskListError", code:"8022"} );
		}
	}
}