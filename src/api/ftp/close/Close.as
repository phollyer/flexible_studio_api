package api.ftp.close
{
	import flash.events.IEventDispatcher;
	import api.ftp.Ftp;

	[Bindable]
	public class Close extends Ftp
	{
		public function Close(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function close():void
		{
			ssCore.Ftp.close( {}
							 ,{callback:actionComplete, errorSTR:"closeError", code:"7001"} );
		}
	}
}