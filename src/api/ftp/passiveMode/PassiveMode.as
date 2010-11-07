package api.ftp.passiveMode
{
	import flash.events.IEventDispatcher;
	import api.ftp.Ftp;

	[Bindable]
	public class PassiveMode extends Ftp
	{
		// Optional
		public var passive:Boolean = false;
		
		public function PassiveMode(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function passiveMode():void
		{
			ssCore.Ftp.passiveMode( {passive:passive}
								   ,{callback:actionComplete, errorSTR:"passiveModeError", code:"7020"} );
		}
	}
}