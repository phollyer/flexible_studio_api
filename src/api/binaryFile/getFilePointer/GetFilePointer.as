package api.binaryFile.getFilePointer
{
	import flash.events.IEventDispatcher;
	
	import api.binaryFile.BinaryFile;
	
	[Event(name="result", type="api.events.binaryFile.getFilePointer.GetFilePointerEvent")]
	[Bindable]
	public class GetFilePointer extends BinaryFile
	{
		// Results
		public var pointerIndex:Number = 0;
		public var systemError:String = null;
		
		public function GetFilePointer(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getFilePointer():void
		{
			ssCore.BinaryFile.getFilePointer( {} , {callback:actionComplete, errorSTR:"getFilePointerError", code:"11004"} );
		}
		private function sendResults( r:Object ):void
		{
			pointerIndex = Number( r.result );
			var e : GetFilePointerEvent = new GetFilePointerEvent( GetFilePointerEvent.RESULT );
			e.systemError = systemError;
			e.pointerIndex = pointerIndex;
			dispatchEvent( e );
		}
	}
}