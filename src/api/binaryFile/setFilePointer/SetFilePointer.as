package api.binaryFile.setFilePointer
{
	import flash.events.IEventDispatcher;
	
	import api.binaryFile.BinaryFile;
	
	[Bindable]
	public class SetFilePointer extends BinaryFile
	{
		// Required
		public var pointerIndex:Number = -1;
		
		// Results
		public var systemError:String = null;
		
		public function SetFilePointer(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setFilePointer( offset:Number = -1 ):void
		{
			pointerIndex = compareNumbers( offset , pointerIndex );
			switch( pointerIndex > 0 )
			{
				case true:
					setPointer();
					break;
				case false:
					invalidPointer();
			}
		}
		private function setPointer():void
		{
			ssCore.BinaryFile.setFilePointer( {offest:String( pointerIndex )} , {callback:actionComplete, errorSTR:"setFilePointerError", code:"11009"} );
		}
		private function invalidPointer():void
		{
			var e : SetFilePointerEvent = new SetFilePointerEvent( SetFilePointerEvent.RESULT_POINTER );
			dispatchEvent( e );
		}
	}
}