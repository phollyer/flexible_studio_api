package api.ftp.transfer
{
	import flash.events.IEventDispatcher;
	import api.ftp.Ftp;

	[Bindable]
	public class Transfer extends Ftp
	{
		public function Transfer(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function transfer():void
		{
			ssCore.Ftp.transfer( {}
								,{callback:actionComplete, errorSTR:"transferError", code:"7026"} );
		}
	}
}