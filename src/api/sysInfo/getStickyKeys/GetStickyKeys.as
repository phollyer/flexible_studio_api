package api.sysInfo.getStickyKeys
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.sysInfo.getStickyKeys.GetStickyKeysEvent;
	import api.sysInfo.SysInfo;
	
	[Event(name="result", type="api.events.sysInfo.getStickyKeys.GetStickyKeysEvent")]
	[Bindable]
	public class GetStickyKeys extends SysInfo
	{
		// Result
		public var hotkey:Boolean = false;
		public var sticky:Boolean = false;
		
		public function GetStickyKeys(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getStickyKeys():void
		{
			ssCore.SysInfo.getStickyKeys( {}
										 ,{callback:actionComplete, errorSTR:"getStickyKeysError", code:"38013"} );
		}
		override protected function sendResult( r:Object ):void
		{
			hotkey = checkBoolean( r.hotkey );
			sticky = checkBoolean( r.sticky );
			
			var e : GetStickyKeysEvent = new GetStickyKeysEvent( GetStickyKeysEvent.RESULT );
			e.hotkey = hotkey;
			e.sticky = sticky;
			dispatchEvent( e );
		}
	}
}