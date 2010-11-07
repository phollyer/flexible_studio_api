package api.app.showFolderBrowser
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.showFolderBrowser.ShowFolderBrowserEvent;

	[Event(name="result", type="api.events.app.showFolderBrowser.ShowFolderBrowserEvent")]
	[Bindable]
	public class ShowFolderBrowser extends App
	{
		// Required
		public var path:String = null;
		public var title:String = null;
		
		public function ShowFolderBrowser(target:IEventDispatcher=null)
		{
			super(target);
		}
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
		override protected function sendResult( r:Object ):void
		{
			path = r.result;
			var e : ShowFolderBrowserEvent = new ShowFolderBrowserEvent( ShowFolderBrowserEvent.RESULT );
			e.folderPath = path;
			dispatchEvent( e );
		}
	}
}