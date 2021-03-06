package api.app.showFolderBrowser
{
	import api.app.App;

	import api.events.app.showFolderBrowser.ShowFolderBrowserEvent;

	import flash.events.IEventDispatcher;

	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.app.showFolderBrowser.ShowFolderBrowserEvent.RESULT
	 */
	[Event(name="result", type="api.events.app.showFolderBrowser.ShowFolderBrowserEvent")]
	[Bindable]
	/**
	 * Display the standard Windows Browse For Folders dialog to select a folder.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showFolderBrowser.html Northcode Help Documentation
	 */
	public class ShowFolderBrowser extends App
	{
		// Required
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var path:String = null;
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var title:String = null;
		
		/**
		 * Constructor for App.ShowFolderBrowser()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showFolderBrowser.html Northcode Help Documentation
		 */
		public function ShowFolderBrowser(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Display the standard Windows Browse For Folders dialog to select a folder.
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showFolderBrowser.html Northcode Help Documentation
		 */
		public function showFolderBrowser():void
		{
			var __o:Object = new Object();
			switch( path != null )
			{
				case true:
					__o.path = path;
			}
			switch( title != null )
			{
				case true:
					__o.title = title;
			}
			ssCore.App.showFolderBrowser( __o , {callback:actionComplete, errorSTR:"showFolderBrowserError", code:"8002"} );
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			path = r.result;
			var e : ShowFolderBrowserEvent = new ShowFolderBrowserEvent( ShowFolderBrowserEvent.RESULT );
			e.folderPath = path;
			dispatchEvent( e );
		}
	}
}