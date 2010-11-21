package api.app.notifiers
{
	import api.app.App;

	import api.events.app.notifiers.OnDragDropEvent;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.app.notifiers.OnDragDropEvent.RESULT
	*/
	[Event(name="result", type="api.events.app.onDragDrop.OnDragDropEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_onDragDrop.html Northcode Help Documentation
	*/
	public class OnDragDrop extends App
	{
		// Results
		/**
		* 
		*
		* @defaultValue <code>new</code>
		*/
		public var fileList:Array = new Array();
		/**
		* 
		*
		* @defaultValue <code>new</code>
		*/
		public var folderList:Array = new Array();
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var x:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var y:Number = 0;
		
		/**
		* Constructor for App.OnDragDrop()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_onDragDrop.html Northcode Help Documentation
		*/
		public function OnDragDrop(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.App.setNotify( {event:App.ON_DRAG_DROP} , {callback:actionComplete, errorSTR:"onDragDropError", code:"8029"} );
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