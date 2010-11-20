package api.sysInfo.setStickyKeys
{
	import flash.events.IEventDispatcher;
	import api.sysInfo.SysInfo;
	
	[Bindable]
	public class SetStickyKeys extends SysInfo
	{
		// Optional
		public var hotkey:Boolean = false;
		public var sticky:Boolean = false;
		
		public function SetStickyKeys(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setStickyKeys():void
		{
			ssCore.SysInfo.setStickyKeys( {hotkey:hotkey , sticky:sticky}
										 ,{callback:actionComplete, errorSTR:"setStickyKeysError", code:"3808"} );
		}
	}
}