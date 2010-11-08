package api.ado.setRowFormat
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	import api.vos.ado.SetRowFormatVO;

	[Bindable]
	public class SetRowFormat extends Ado
	{
		// Optional
		public var format:String = SetRowFormatVO.XML;
		
		public function SetRowFormat(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setRowFormat():void
		{
			ssCore.Ado.setRowFormat( {format:format}
									,{callback:actionComplete, errorSTR:"setRowFormatError", code:"16022"} );
		}
	}
}