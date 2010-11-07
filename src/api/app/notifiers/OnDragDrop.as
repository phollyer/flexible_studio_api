package api.app.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.notifiers.OnDragDropEvent;
	
	[Event(name="result", type="api.events.app.onDragDrop.OnDragDropEvent")]
	[Bindable]
	public class OnDragDrop extends App
	{
		// Results
		public var fileList:Array = new Array();
		public var folderList:Array = new Array();
		public var x:Number = 0;
		public var y:Number = 0;
		
		public function OnDragDrop(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.App.setNotify( {event:App.ON_DRAG_DROP} , {callback:actionComplete, errorSTR:"onDragDropError", code:"8029"} );
		}
		override protected function sendResult( r:Object ):void
		{
			fileList = new Array();
			fileList = r.result.split( "\r" );
			x = r.point.split( "," )[ 0 ];
			y = r.point.split( "," )[ 1 ];
			
			var e : OnDragDropEvent = new OnDragDropEvent( OnDragDropEvent.RESULT );
			e.fileList = fileList;
			e.x = x;
			e.y = y;
			dispatchEvent( e );
		}
	}
}