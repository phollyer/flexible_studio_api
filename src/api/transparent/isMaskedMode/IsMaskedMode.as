package api.transparent.isMaskedMode
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.transparent.isMaskedMode.IsMaskedModeEvent;
	import api.transparent.Transparent;
	
	[Event(name="result", type="api.events.transparent.isMaskedMode.IsMaskedModeEvent")]
	[Bindable]
	public class IsMaskedMode extends Transparent
	{
		// Result
		public var isMasked:Boolean = true;
		
		public function IsMaskedMode(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function isMaskedMode():void
		{
			ssCore.Transparent.isMaskedMode( {}
									  		,{callback:actionComplete, errorSTR:"isMaskedModeError", code:"42004"} );
		}
		override protected function sendResult( r:Object ):void
		{
			isMasked = checkBoolean( r.result );
			
			var e : IsMaskedModeEvent = new IsMaskedModeEvent( IsMaskedModeEvent.RESULT );
			e.isMasked = isMasked;
			dispatchEvent( e );
		}
	}
}