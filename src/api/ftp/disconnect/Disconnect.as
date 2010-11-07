package api.ftp.disconnect
{
	import flash.events.IEventDispatcher;
	import api.ftp.Ftp;

	[Bindable]
	public class Disconnect extends Ftp
	{
		public function Disconnect(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function disconnect():void
		{
			ssCore.Ftp.disconnect( {}
								  ,{callback:actionComplete, errorSTR:"disconnectError", code:"7003"} );
		}
	}
}