package api.app.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.notifiers.OnWindowEvent;
	
	[Event(name="result", type="api.events.app.onWindow.OnWindowEvent")]
	[Bindable]
	public class OnWindow extends App
	{
		// Results
		public var caption:String = null;
		public var hwnd:String = null;
		public var windowClassName:String = null;
		public var windowStyle:String = null;
		
		public function OnWindow(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.App.setNotify( {event:App.ON_WINDOW} , {callback:actionComplete, errorSTR:"onWindowError", code:"8033"} );
		}
		override protected function sendResult( r:Object ):void
		{
			var __a:Array = r.result.split( "," );
			caption = __a[ 1 ];
			hwnd = __a[ 0 ];
			windowClassName = __a[ 2 ];
			windowStyle = __a[ 3 ];
			
			var e : OnWindowEvent = new OnWindowEvent( OnWindowEvent.RESULT );
			e.caption = caption;
			e.hwnd = hwnd;
			e.windowClassName = windowClassName;
			e.windowStyle = windowStyle;
			dispatchEvent( e );
		}		
	}
}