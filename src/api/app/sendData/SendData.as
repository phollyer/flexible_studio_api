package api.app.sendData
{
	import flash.events.IEventDispatcher;
	
	
	import api.app.App;

	[Bindable]
	public class SendData extends App
	{
		// Optional (?? not sure as at 30.6.09)
		public var broadcast:Boolean = false;
		public var data:String = null;
		public var hwnd:String = null;
		
		public function SendData(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function sendData():void
		{
			ssCore.App.sendData( {broadcast:broadcast
								 ,data:data
								 ,hwnd:hwnd} , {callback:actionComplete, errorSTR:"sendDataError", code:"8014"} );
		}
	}
}