package api.ftp.connect
{
	import flash.events.IEventDispatcher;
	import api.ftp.Ftp;

	[Bindable]
	public class Connect extends Ftp
	{
		public function Connect(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function connect():void
		{
			ssCore.Ftp.connect( {}
							   ,{callback:actionComplete, errorSTR:"connectError", code:"7010"} );
		}
	}
}