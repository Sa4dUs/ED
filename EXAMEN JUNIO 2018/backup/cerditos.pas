<?xml version="1.0" encoding="UTF-8"?>
<CONFIG>
  <ProjectOptions>
    <Version Value="12"/>
    <PathDelim Value="\"/>
    <General>
      <Flags>
        <MainUnitHasCreateFormStatements Value="False"/>
        <MainUnitHasTitleStatement Value="False"/>
        <MainUnitHasScaledStatement Value="False"/>
      </Flags>
      <SessionStorage Value="InProjectDir"/>
      <Title Value="cerditos"/>
      <UseAppBundle Value="False"/>
      <ResourceType Value="res"/>
    </General>
    <BuildModes>
      <Item Name="Default" Default="True"/>
    </BuildModes>
    <PublishOptions>
      <Version Value="2"/>
      <UseFileFilters Value="True"/>
    </PublishOptions>
    <RunParams>
      <FormatVersion Value="2"/>
    </RunParams>
    <Units>
      <Unit>
        <Filename Value="cerditos.lpr"/>
        <IsPartOfProject Value="True"/>
      </Unit>
      <Unit>
        <Filename Value="udepartamento.pas"/>
        <IsPartOfProject Value="True"/>
        <UnitName Value="uDepartamento"/>
      </Unit>
      <Unit>
        <Filename Value="upersona.pas"/>
        <IsPartOfProject Value="True"/>
        <UnitName Value="uPersona"/>
      </Unit>
      <Unit>
        <Filename Value="uempresa.pas"/>
        <IsPartOfProject Value="True"/>
        <UnitName Value="uEmpresa"/>
      </Unit>
    </Units>
  </ProjectOptions>
  <CompilerOptions>
    <Version Value="11"/>
    <PathDelim Value="\"/>
    <Target>
      <Filename Value="cerditos"/>
    </Target>
    <SearchPaths>
      <IncludeFiles Value="$(ProjOutDir)"/>
      <UnitOutputDirectory Value="lib\$(TargetCPU)-$(TargetOS)"/>
    </SearchPaths>
  </CompilerOptions>
  <Debugging>
    <Exceptions>
      <Item>
        <Name Value="EAbort"/>
      </Item>
      <Item>
        <Name Value="ECodetoolError"/>
      </Item>
      <Item>
        <Name Value="EFOpenError"/>
      </Item>
    </Exceptions>
  </Debugging>
</CONFIG>
